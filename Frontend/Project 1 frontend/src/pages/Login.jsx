import { useContext, useEffect, useRef, useState } from "react"
import Header from "../Header"
import Footer from "../Footer"
import { Link, useNavigate } from "react-router-dom"
import { MyContext } from "../MyProvider"
import SignUp from "./Signup"

function Login() {
    const emailRef = useRef(null)
    const passwordRef = useRef(null)
    const [error, setError] = useState("")
    const [page, setPage] = useState("")
    const navigate = useNavigate()
    const { api, role, token, user, setRole, setToken, setUser } = useContext(MyContext)

    const Login = async () => {
        if (emailRef.current.value != "" && passwordRef.current.value != "") {
            var email = emailRef.current.value
            var password = passwordRef.current.value
            var api_call = api + "LoginSignup/login?email=" + email + "&password=" + password

            fetch(api_call, {
                method: "GET",
                headers: { "Content-Type": "application/json" },
            }).then(async (res) => {
                if (res.ok) {
                    var role_and_token = await res.text()
                    var l = role_and_token.split(' ')

                    setRole(l[0])
                    setToken(l[1])

                    var id = l[2]
                    api_call = api + "LoginSignup/getUserById/" + id
                    fetch(api_call, {
                        method: "GET",
                        headers: {
                            "Authorization": "Bearer " + l[1],
                            "Content-Type": "application/json"
                        },
                    }).then(async (res) => {
                        if (res.ok) {
                            var loggedInUser = await res.json()
                            setUser(loggedInUser)
                            navigate("/home")
                        } else if (res.status == 400) {
                            //incorrect details entered
                            setError(await res.text())
                        } else if (res.status == 404) {
                            //Email not found
                            setError(await res.text())
                        }

                    })
                }else {
                    setError(await res.text())
                }
            })

        }
    }

    const stopReload = (event) => {
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

    return (
        <>
            <form className="form" onSubmit={stopReload} onClick={(e) => e.stopPropagation()}>
                <div>
                    <h2 style={{ textAlign: "center" }}>Login</h2>
                </div>

                <div>
                    <label>Email</label>
                    <input ref={emailRef} placeholder="email" type="email" required></input>
                    <label>Password</label>
                    <input ref={passwordRef} placeholder="password" type="password" required></input>
                </div>

                <div>
                    {error != "" ? <p className="error-msg">{error}</p> : <></>}
                    <button onClick={Login}>Login</button>
                    <div>Don't have an account? <div onClick={() => setPage("Sign up")}>Sign up</div></div>
                    <a href="/">Forgot password</a>
                </div>
            </form>

            {page == "Sign up" ?
                <div className="container-popup" onClick={() => setPage("")}>
                    <SignUp />
                </div>

                : <></>
            }

        </>
    )
}

export default Login