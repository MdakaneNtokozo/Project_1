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

                {role == "1"? 
                    <div>
                        <p style={{color:"white"}}>nav here</p>
                    </div>:<></>
                }
                    
            </header>
        </>
    )
}

export default Header