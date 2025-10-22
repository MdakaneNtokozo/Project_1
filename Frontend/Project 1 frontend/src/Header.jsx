import { useContext, useState } from "react"
import { MyContext } from "./MyProvider"
import { useNavigate } from "react-router-dom"
import Login from "./pages/UserSections/Login"
import SignUp from "./pages/UserSections/Signup"


function Header() {
    const { role } = useContext(MyContext)
    const [page, setPage] = useState("")
    const navigate = useNavigate()

    return (
        <>
            <header>
                <h1><span onClick={() => navigate('/home')}>VacayPay</span></h1>

                {role == 1 ?
                    <nav>
                        <p>Vacation plans</p>
                        <p onClick={() => navigate('/profile')}>Profile</p>
                    </nav> :
                    <></>
                }

                {role == "" ?
                    <nav>
                        <button onClick={() => setPage("Sign up")}>Sign up</button>
                        <button onClick={() => setPage("Login")}>Login</button>
                    </nav> :
                    <></>
                }
            </header>

            {page == "Login" ?
                <div className="container-popup" onClick={() => setPage("")}> 
                    <Login />
                </div>
                : <></>
            }

            {page == "Sign up" ?
                <div className="container-popup" onClick={() => setPage("")}> 
                    <SignUp />
                </div>
                
                : <></>
            }
        </>
    )
}

export default Header