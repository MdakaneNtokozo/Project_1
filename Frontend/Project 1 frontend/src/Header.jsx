import { useContext, useEffect, useState } from "react"
import { MyContext } from "./MyProvider"
import { Link, NavLink } from "react-router-dom"
import Login from "./pages/UserSections/Login"
import SignUp from "./pages/UserSections/Signup"


function Header() {
    const { 
        user,
        setSelectedDestination,
        setStartDate,
        setEndDate,
        setSelectedSpenderType,
        setSelectedBuddies,
        setSelectedTransportations,
        setSelectedAccommodations,
        setSelectedFoodSpots,
        setSelectedAttractions,
        setTransList,
        setTransTotal,
        setAccommList,
        setAccommTotal,
        setSpotsList,
        setSpotsTotal,
        setAttrsList,
        setAttrsTotal,
        setVacayPlan
    } = useContext(MyContext)
    const [page, setPage] = useState("")
    const [menuVisible, setMenuVisible] = useState(false)

    // useEffect(() => {
    //     setSelectedDestination(null)
    //     setStartDate(null)
    //     setEndDate(null)
    //     setSelectedSpenderType(null)
    //     setSelectedBuddies([])
    //     setSelectedTransportations([])
    //     setSelectedAccommodations([])
    //     setSelectedFoodSpots([])
    //     setSelectedAttractions([])
    //     setTransList([])
    //     setTransTotal(0)
    //     setAccommList([])
    //     setAccommTotal(0)
    //     setSpotsList([])
    //     setSpotsTotal(0)
    //     setAttrsList([])
    //     setAttrsTotal(0)
    //     setVacayPlan(null)
    // }, [])

    const clearData = () => {
        setSelectedDestination(null)
        setStartDate(null)
        setEndDate(null)
        setSelectedSpenderType(null)
        setSelectedBuddies([])
        setSelectedTransportations([])
        setSelectedAccommodations([])
        setSelectedFoodSpots([])
        setSelectedAttractions([])
        setTransList([])
        setTransTotal(0)
        setAccommList([])
        setAccommTotal(0)
        setSpotsList([])
        setSpotsTotal(0)
        setAttrsList([])
        setAttrsTotal(0)
        setVacayPlan(null)
    }

    return (
        <>
            <header>
                {/* <h1><span onClick={() => navigate('/home')}>VacayPay</span></h1> */}
                <Link className="title" to='/home' onClick={() => clearData()}>VacayPay</Link>

                <div className="nav-bar">
                    <div className="hamburger-nav" onClick={() => setMenuVisible(!menuVisible)}>
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    {user != null ?
                        <nav className={menuVisible == true ? "open": ""}>
                            <NavLink to='/viewVacayPlans' onClick={() => clearData()}>View plans</NavLink>
                            <NavLink to='/profile' onClick={() => clearData()}>Profile</NavLink>
                        </nav> :
                        <></>
                    }

                    {user == null ?
                        <nav className={menuVisible == true ? "open": ""}>
                            <p onClick={() => { 
                                setPage("Sign up")
                                setMenuVisible(false)
                            }}>Sign up</p>
                            <p onClick={() => {
                                setPage("Login")
                                setMenuVisible(false)
                            }}>Login</p>
                        </nav> :
                        <></>
                    }

                </div>

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