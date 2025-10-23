import { useContext, useEffect, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"
import { useNavigate } from "react-router-dom"
import { MyContext } from "../MyProvider"
import Loading from "../Loading"

function ViewVacayPlans() {
    const [plans, setPlans] = useState([])
    const { role, user, api, token, setCurrency } = useContext(MyContext)
    const navigate = useNavigate()
    const [isLoading, setIsLoading] = useState(true)
    const [filter, setFilter] = useState(1)

    useEffect(() => {
        //Info
        var api_call = api + "VacayPlansControllerr/getPlanInfo/" + user.userId
        if (plans.length == 0) {
            fetch(api_call, {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token,
                    "Content-Type": "application/json"
                },
            }).then(async res => {
                setPlans(await res.json())
                setIsLoading(false)
            })
        }
    }, [filter])

    while (isLoading == true) {
        return <Loading />
    }

    const viewPlan = (plan) => {
        navigate('/viewVacayPlan', { state: { plan: plan } })
    }

    const filterItems = (filter) => {
        if (filter == 2) {
            setPlans(plans.sort((a, b) => new Date(a.vacation.vacationStartDate) - new Date(b.vacation.vacationStartDate)))
        } else if (filter == 3) {
            setPlans(plans.sort((a, b) => new Date(b.vacation.vacationStartDate) - new Date(a.vacation.vacationStartDate)))
        } else if (filter == 4) {
            setPlans(plans.sort((a, b) => a.vacayPlan.planBudget - b.vacayPlan.planBudget))
        } else if (filter == 5) {
            setPlans(plans.sort((a, b) => b.vacayPlan.planBudget - a.vacayPlan.planBudget))
        }
        setFilter(filter)
    }

    return (
        <>
            <Header />

            <div className="container">
                <div className="home">
                    <h2>Viewing all vacation plans</h2>
                    <hr />

                    <select value={filter} onChange={(e) => filterItems(e.target.value)}>
                        <option value={1}>Filter by:</option>
                        <option value={2}>Date (ascending)</option>
                        <option value={3}>Date (descending)</option>
                        <option value={4}>lowest - highest budget</option>
                        <option value={5}>Highest - lowest budget</option>
                    </select>

                    {plans.length == 0 ?

                        <div className="home-no-plans">
                            <h3>No plans created yet</h3>
                        </div>
                        :
                        <div className="home-plans">
                            {plans.map((plan, idx) => {
                                return <div className="plan" key={idx} onClick={() => viewPlan(plan)}>
                                    <p className="planLeft">Vacation plan for {plan.destination.destinationName}</p><p className="planRight">{plan.vacayDaysLeft} days left</p>
                                </div>
                            })}
                        </div>

                    }

                </div>

            </div>

            <Footer />
        </>
    )
}

export default ViewVacayPlans