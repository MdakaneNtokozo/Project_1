import { useContext, useRef, useState } from "react"
import Header from "../Header"
import Footer from "../Footer"
import { useNavigate } from "react-router-dom"
import { MyContext } from "../MyProvider"

function SignUp() {
    const nameRef = useRef(null)
    const surnameRef = useRef(null)
    const emailRef = useRef(null)
    const passwordRef = useRef(null)
    const confirmRef = useRef(null)
    const [error, setError] = useState("")
    const navigate = useNavigate();
    const { api } = useContext(MyContext)
    
    const SignUp = async () => {
        const api_call = api + "LoginSignup/signUp"
        if (nameRef.current.value != "" &&
            surnameRef.current.value != "" &&
            emailRef.current.value != "" &&
            passwordRef.current.value != "" &&
            confirmRef.current.value != "") {

            if (passwordRef.current.value == confirmRef.current.value) {
                const newUser = {
                    userId: 0,
                    userName: nameRef.current.value,
                    userSurname: surnameRef.current.value,
                    userEmail: emailRef.current.value,
                    userPassword: passwordRef.current.value,
                    userCreatedDate: new Date()
                }

                try {
                    const res = await fetch(api_call, {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify(newUser)
                    })

                    if (res.status == 201) {
                        //Sign in is successful
                        navigate("/")
                    } else if(res.status == 400){
                        //Email is already in use
                        setError(await res.text())
                    }

                } catch (err) {
                    console.error(err)
                }

            } else {
                setError("Passwords don't match")
            }
            //navigate('/')
        }
    }

    const stopReload = (event) =>{
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

    return (
        <>
            <Header />

            <div className="form-container">
                <form className="form" onSubmit={stopReload}>
                    <div>
                        <h2>Sign up</h2>
                    </div>

                    <div>
                        <input ref={nameRef} placeholder="name" type="text" required></input>
                        <input ref={surnameRef} placeholder="surname" type="text" required></input>
                        <input ref={emailRef} placeholder="email" type="email" required></input>
                        <input ref={passwordRef} placeholder="password" type="password" required></input>
                        <input ref={confirmRef} placeholder="confirm password" type="password" required></input>
                    </div>

                    <div>
                        {error != "" ? <p className="error-msg">{error}</p> : <></>}
                        <button onClick={SignUp}>Sign up</button><br />
                    </div>

                </form>
            </div>

            <Footer />
        </>
    )
}

export default SignUp