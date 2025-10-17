import { useContext, useEffect, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"
import { useNavigate } from "react-router-dom"
import { MyContext } from "../MyProvider"
import { Rating } from "react-simple-star-rating"

function Home() {
    const [plans, setPlans] = useState([])
    const [top3Destinations, setTop3Destinations] = useState([])
    const { role, user, api, token } = useContext(MyContext)
    const navigate = useNavigate()

    useEffect(() => {
        var api_call = api + "Destinations/getTopDestinations"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            if(res.status == 401){
                console.log("unauthorized")
                navigate('/')
            }else{
                setTop3Destinations(await res.json())
            }
        })
    }, [])

    const viewPlan = (idx) => {
        console.log(idx)
    }

    return (
        <>
            <Header />

            {role == 1 ?
                <div className="container">
                    <div className="home">
                        <h2>Welcome {user.userName}</h2>
                        <hr />
                        <h2>Upcoming vacations</h2>

                        {plans.length == 0 ?
                            <div className="home-no-plans">
                                <h3>No upcoming vacations planned</h3>
                            </div> :
                            <div>
                                {plans.map((plan, idx) => {
                                    return <div key={idx} onClick={() => viewPlan(idx)} className="home-plans"><p>{plan}</p><p>3 days left</p></div>
                                })}
                            </div>
                        }

                        <div>
                            <button onClick={() => navigate('/addVacayPlan')}>Add vacation plan</button>
                        </div>

                        <hr />
                        <h2>Explore destination</h2>
                        <div className="home-top-destinations">
                            {top3Destinations.length != 0 ?
                                top3Destinations.map(dest => {
                                    return <div key={dest.destinationId} className="card-ui">
                                        <div className="card-img">
                                            <img src={dest.destinationImage}></img>
                                            <div className="card-rating">
                                                <Rating initialValue={dest.destinationRating} readonly allowFraction size={"20px"}></Rating>
                                            </div>

                                        </div>
                                        <p>{dest.destinationName}</p>
                                        <p>country</p>
                                        <p>{dest.destinationDescription}</p>
                                    </div>
                                }) :
                                <p>No top destination</p>
                            }

                            
                        </div>

                    </div>

                </div>
                :
                <></>
            }

            <Footer />
        </>
    )
}

export default Home