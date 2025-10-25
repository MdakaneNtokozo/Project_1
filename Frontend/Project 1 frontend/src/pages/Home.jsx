import { useContext, useEffect, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"
import { useNavigate } from "react-router-dom"
import { MyContext } from "../MyProvider"
import { Rating } from "react-simple-star-rating"
import Loading from "../Loading"

function Home() {
    const [plans, setPlans] = useState([])
    const [countries, setCountries] = useState([])
    const [top3Destinations, setTop3Destinations] = useState([])
    const { 
        user, 
        api, 
        token, 
        setCurrency,
        setSelectedDestination
     } = useContext(MyContext)
    const navigate = useNavigate()
    const [loading1, setLoading1] = useState(true)
    const [loading2, setLoading2] = useState(true)

    useEffect(() => {
        // //Top 3 destinations
        var api_call = api + "Destinations/getTopDestinations"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            if (res.status == 401) {
                navigate('/')
            } else {
                setTop3Destinations(await res.json())
                if (res.ok) {
                    //Countries
                    var api_call = api + "Destinations/getCountries"
                    fetch(api_call, {
                        method: "GET",
                        headers: {
                            "Authorization": "Bearer " + token,
                            "Content-Type": "application/json"
                        },
                    }).then(async res => {
                        setCountries(await res.json())
                        setLoading1(false)
                    })

                }

            }
        })

        //Currency
        api_call = api + "Destinations/getCurrency?currencyId=" + user.currencyId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setCurrency(await res.json())
        })

        //Info
        api_call = api + "VacayPlansControllerr/getPlanInfo/" + user.userId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setPlans(await res.json())
            setLoading2(false)
        })

    }, [])

    while (loading1 == true || loading2 == true) {
        return <Loading />
    }

    const viewPlan = (plan) => {
        navigate('/viewVacayPlan', { state: { plan: plan } })
    }

    const formatDate = (date) => {
        if (date == null) {
            return ""
        } else {
            var date = new Date(date)
            if (date != "") {
                const year = date.getFullYear()
                const month = date.getMonth() + 1
                const day = date.getDate()

                return year + "-" + month + "-" + (day < 10 ? "0" + day : day)
            }
        }
    }

    return (
        <>
            <Header />

            <div className="container">
                <div className="home">
                    <h2>Welcome {user.userName}</h2>
                    <hr />
                    <h2>Upcoming vacations</h2>

                    {plans.length == 0 ?
                        <div className="home-no-plans">
                            <h3>No upcoming vacations planned</h3>
                        </div> :
                        <div className="home-plans">
                            {plans.map((plan, idx) => {
                                var today = new Date(formatDate(Date.now()))
                                var planDate = new Date(formatDate(plans[0].vacation.vacationStartDate))

                                if (planDate >= today) {
                                    return <div className="plan" key={idx} onClick={() => viewPlan(plan)}>
                                        <p className="planLeft">Vacation plan for {plan.destination.destinationName}</p><p className="planRight">{plan.vacayDaysLeft} days left</p>
                                    </div>
                                }
                            })}
                        </div>
                    }

                    <div>
                        <button onClick={() => navigate('/vacayPlan')}>Add vacation plan</button>
                    </div>

                    <hr />
                    <h2>Explore destination</h2>
                    <div className="home-top-destinations">
                        {top3Destinations.length != 0 ?
                            top3Destinations.map(dest => {
                                return <div key={dest.destinationId} className="card-ui" onClick={() => {
                                    setSelectedDestination(dest)
                                    navigate('/vacayPlan/vacayDetails')
                                }}>
                                    <div className="card-img">
                                        <img src={dest.destinationImage}></img>
                                        <div className="card-rating">
                                            <Rating initialValue={dest.destinationRating} readonly allowFraction size={"20px"}></Rating>
                                        </div>

                                    </div>
                                    <p className="card-title">{dest.destinationName}</p>
                                    <p className="card-subtitle">{countries.find(c => c.countryId == dest.countryId).countryName}</p>
                                    <p>{dest.destinationDescription}</p>
                                </div>
                            }) :
                            <p>No top destination</p>
                        }


                    </div>

                </div>

            </div>

            <Footer />
        </>
    )
}

export default Home