import { useState } from "react"
import Footer from "../Footer"
import Header from "../Header"
import { useNavigate } from "react-router-dom"

function Home(){
    const [name, setName] = useState("Ntokozo")
    const [plans, setPlans] = useState(["Vacation plan 1", "Vacation plan 2", "Vacation plan 3"])
    //const [plans, setPlans] = useState([])
    const navigate = useNavigate()

    const viewPlan = (idx) => {
        console.log(idx)
    }

    const addPlan = () => {
        navigate('/addPlan')
    }

    return(
        <>
            <Header />

            <div className="home-container">
                <h2>Welcome {name}</h2>
                <h3>Upcoming vacations</h3>
                
                <div className="home-content">
                    {plans.length == 0 ?
                    <div className="no-plans-container">
                        <img src="\src\assets\no upcoming vacation plans.png" alt="no upcoming vacation plans"></img>
                    </div>:
                    <div className="plans-container">
                        {plans.map((plan, idx) => {
                            return <div key={idx} onClick={() => viewPlan(idx)}><p>{plan}</p><p className="left-p">3 days left</p></div>
                        })}
                    </div>
                    }
                    <div>
                        <button onClick={addPlan}>Add vacation plan</button>
                    </div>
                </div>
                
            </div>

            <Footer />
        </>
    )
}

export default Home