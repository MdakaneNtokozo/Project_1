import { useContext } from "react"
import { MyContext } from "./MyProvider"

function Header(){
    const {role} = useContext(MyContext)

    return(
        <>
            <header>
                <h1>VacayPay</h1>

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