import Link from "next/link";

const ProfilePage = () => {
  return (
    <div>
      <h1>Profile Page</h1>
      <Link href="/profile/edit">edit</Link>
    </div>
  );
};

export default ProfilePage;
