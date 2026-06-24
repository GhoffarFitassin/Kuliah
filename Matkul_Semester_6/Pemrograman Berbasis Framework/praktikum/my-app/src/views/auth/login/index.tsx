/* eslint-disable @typescript-eslint/no-explicit-any */
import Link from "next/link";
import style from "./login.module.scss";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import { signIn, useSession } from "next-auth/react";

const TampilanLogin = () => {
  const [isLoading, setIsLoading] = useState(false);
  const { push, query, back } = useRouter();
  const { data: session, status } = useSession();
  const callbackUrl: any = query.callbackUrl || "/";
  const [error, setError] = useState("");

  // Redirect authenticated users away from the login page
  useEffect(() => {
    if (status === "authenticated") {
      push(callbackUrl);
    }
  }, [status, callbackUrl, push]);

  const handleSubmit = async (event: any) => {
    event.preventDefault();
    setError("");
    setIsLoading(true);

    //const form = event.currentTarget; ...
    // }
    try {
      const res = await signIn("credentials", {
        redirect: false,
        email: event.target.email.value,
        password: event.target.password.value,
        callbackUrl,
      });

      // console.log("signIn response:", res);
      if (!res?.error) {
        setIsLoading(false);
        push(callbackUrl);
      } else {
        setIsLoading(false);
        setError(res?.error || "Login failed");
      }
    } catch (error) {
      setIsLoading(false);
      setError("wrong email or password");
    }
  };

  // Show nothing while checking authentication status
  if (status === "loading") {
    return null;
  }

  // Authenticated users will be redirected, don't render the form
  if (status === "authenticated") {
    return null;
  }

  return (
    <>
      <div className={style.login}>
        {error && <p className={style.login__error}>{error}</p>}
        <h1 className={style.login__title}>Halaman Login</h1>
        <div className={style.login__form}>
          <form onSubmit={handleSubmit}>
            <div className={style.login__form__item}>
              <label htmlFor="email" className={style.login__form__item__label}>
                Email
              </label>
              <input
                type="email"
                id="email"
                name="email"
                placeholder="Email"
                className={style.login__form__item__input}
              />
            </div>
            <div className={style.login__form__item}>
              <label
                htmlFor="Password"
                className={style.login__form__item__label}
              >
                Password
              </label>
              <input
                type="password"
                id="Password"
                name="password"
                placeholder="Password"
                className={style.login__form__item__input}
              />
            </div>
            <button
              type="submit"
              className={style.login__form__item__button}
              disabled={isLoading}
            >
              {isLoading ? "Memproses..." : "Login"}
            </button>
            <br /> <br />
            <button
              onClick={() => signIn("google", { callbackUrl, redirect: false })}
              className={style.login__form__item__button}
              disabled={isLoading}
            >
              {isLoading ? "Loading..." : "sign in with google"}
            </button>
            <br /> <br />
            <button
              onClick={() => signIn("github", { callbackUrl, redirect: false })}
              className={`${style.login__form__item__button} ${style["login__form__item__button--github"]}`}
              disabled={isLoading}
            >
              {isLoading ? "Loading..." : "sign in with github"}
            </button>
          </form>
          <br />
          <p className={style.login__form__item__text}>
            Tidak punya akun?{" "}
            <Link
              href={`/auth/register?callbackUrl=${encodeURIComponent(callbackUrl)}`}
            >
              Ke Halaman Register
            </Link>
          </p>
        </div>
      </div>
    </>
  );
};

export default TampilanLogin;
