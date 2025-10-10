import { useRef, useState } from "react"
import Header from "../Header"
import Footer from "../Footer"
import { useNavigate } from "react-router-dom"

function Login() {
    const emailRef = useRef(null)
    const passwordRef = useRef(null)
    const [error, setError] = useState("")
    const navigate = useNavigate()

    const Login = async () => {
        if (emailRef.current.value != "" && passwordRef.current.value != "") {
            var email = emailRef.current.value
            var password = passwordRef.current.value
            var api_call = "https://localhost:44353/api/LoginSignup/login?email=" + email + "&password=" + password
            try {
                const res = await fetch(api_call, {
                    method: "GET",
                    headers: { "Content-Type": "application/json" },
                })

                if (res.status == 200) {
                    var role_and_token = await res.text()
                    console.log("Status test: " + role_and_token)
                    var l = role_and_token.split(' ')
                    var role = l[0]
                    var token = l[1]
                    console.log("Role: " + role)
                    console.log("Role: " + token)

                    if (role == "1") {
                        navigate("/home")
                    } else {
                        console.log("admin home page coming soon")
                    }
                } else if(res.status == 400){
                    //incorrect details entered
                    setError(await res.text())
                }else if(res.status == 404){
                    //Email not found
                    setError(await res.text())
                }

            } catch (err) {
                console.error(err)
            }
        }

    }

    const stopReload = (event) => {
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

    return (
        <>
            <Header />

            <div className="form-container">
                <form className="form" onSubmit={stopReload}>
                    <div>
                        <h2>Login</h2>
                    </div>

                    <div>
                        <input ref={emailRef} placeholder="email" type="email" required></input>
                        <input ref={passwordRef} placeholder="password" type="password" required></input>
                    </div>

                    <div>
                        {error != "" ? <p className="error-msg">{error}</p> : <></>}
                        <button onClick={Login}>Login</button><br />
                        <a href="/">Forgot password</a>
                    </div>

                </form>
            </div>

            <Footer />
        </>
    )
}

export default Login