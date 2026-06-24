import {
  getFirestore,
  collection,
  getDocs,
  getDoc,
  doc,
  query,
  addDoc,
  where,
  updateDoc,
  QueryConstraint,
} from "firebase/firestore";
import app from "./firebase";
import bcrypt from "bcrypt";

const db = getFirestore(app);

export async function queryCollection(
  collectionName: string,
  constraints: QueryConstraint[],
): Promise<any[]> {
  const q = query(collection(db, collectionName), ...constraints);
  const snapshot = await getDocs(q);
  return snapshot.docs.map((doc) => ({
    id: doc.id,
    ...doc.data(),
  }));
}

export async function findUserByEmail(email: string) {
  const results = await queryCollection("users", [where("email", "==", email)]);
  return results.length > 0 ? results[0] : null;
}

export async function retrieveProducts(collectionName: string) {
  const snapshot = await getDocs(collection(db, collectionName));
  return snapshot.docs.map((doc) => ({
    id: doc.id,
    ...doc.data(),
  }));
}

export async function retrieveDataById(collectionName: string, id: string) {
  const snapshot = await getDoc(doc(db, collectionName, id));
  return snapshot.data();
}

export async function signIn(email: string) {
  return findUserByEmail(email);
}

export async function signUp(
  userData: {
    email: string;
    fullname: string;
    password: string;
    role?: string;
  },
  callback: Function,
) {
  const existingUser = await findUserByEmail(userData.email);

  if (existingUser) {
    callback({
      status: "error",
      message: "Email already exists",
    });
    return;
  }

  userData.password = await bcrypt.hash(userData.password, 10);
  if (!userData.role) {
    userData.role = "member";
  }

  try {
    await addDoc(collection(db, "users"), userData);
    callback({
      status: "success",
      message: "User registered successfully",
    });
  } catch (error: any) {
    callback({
      status: "error",
      message: error.message,
    });
  }
}

export async function signInWithOAuth(userData: any, callback: any) {
  try {
    const existingUser = await findUserByEmail(userData.email);

    if (existingUser) {
      userData.role = existingUser.role;
      await updateDoc(doc(db, "users", existingUser.id), userData);
      callback({
        status: true,
        message: "User registered and logged in with OAuth",
        data: userData,
      });
    } else {
      userData.role = "member";
      await addDoc(collection(db, "users"), userData);
      callback({
        status: true,
        message: "User registered and logged in with OAuth",
        data: userData,
      });
    }
  } catch (error: any) {
    callback({
      status: false,
      message: "Failed to register user with OAuth",
    });
  }
}

export { signInWithOAuth as signInWithGoogle };
