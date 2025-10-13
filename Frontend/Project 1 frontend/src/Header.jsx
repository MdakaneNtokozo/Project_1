import { useContext } from "react"
import { MyContext } from "./MyProvider"
import { useNavigate } from "react-router-dom"

function Header(){
    const {role} = useContext(MyContext)
    const navigate = useNavigate()

    return(
        <>
            <header>
                <h1><span onClick={() => navigate('/home')}>VacayPay</span></h1>

                {role == 1 ? 
                    <nav className="nav-bar">
                        <img src="\src\assets\notification bell.png" alt="notification bell" className="icon"></img>
                        <img src="\src\assets\profile icon.png" alt="profile picture" className="icon" onClick={() => navigate('/profile')}></img>
                    </nav>:
                    <></>
                }
                    
            </header>
        </>
    )
}

export default Header