import { useContext, useEffect, useRef, useState } from "react"
import { MyContext } from "../../MyProvider"
import Header from "../../Header"
import Footer from "../../Footer"
import { useNavigate } from "react-router-dom"

function Profile() {
    const {
        api,
        token, setToken,
        user, setUser,
        currency, setCurrency
    } = useContext(MyContext)
    const [edit, setEdit] = useState("")
    const [currencies, setCurrencies] = useState([])

    const newEmailRef = useRef()
    const retypeEmailRef = useRef()

    const prevPasswordRef = useRef()
    const newPassowrdRef = useRef()
    const retypePasswordRef = useRef()

    const [name, setName] = useState(user.userName)
    const [surname, setSurname] = useState(user.userSurname)
    const [bio, setBio] = useState(user.userBio)
    const [email, setEmail] = useState(user.userEmail)
    const [selectedCurrencyId, setSelectedCurrencyId] = useState(currency.currencyId)

    const navigate = useNavigate()

    useEffect(() => {
        var api_call = api + "Destinations/getCurrencies"
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            const data = await res.json()
            setCurrencies(data)
        })

    }, [])

    const updateUser = () => {
        var api_call = api + "LoginSignup/updateProfile"
        fetch(api_call, {
            method: "PUT",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify(user)
        }).then(async res => {

            if (res.ok) {
                setUser(await res.json())
                setEdit("")
            }
        })
    }

    const editProfileDetails = () => {
        if (user.userName != name) {
            user.userName = name
        }

        if (user.userSurname != surname) {
            user.userSurname = surname
        }

        if (user.userBio != bio) {
            user.userBio = bio
        }

        updateUser()
        alert("Your profile details have been updated")
        setEdit("")
    }

    const editEmailDetails = () => {
        var newEmail = newEmailRef.current.value
        var retypeEmail = retypeEmailRef.current.value

        if (newEmail == retypeEmail) {
            if (user.userEmail != newEmail) {
                user.userEmail = newEmail

                updateUser()
                alert("Your email is updated")
                setEdit("")
            } else {
                alert("Emails are the same")
            }
        }
    }

    const editPasswordDetails = () => {
        var prevPassword = prevPasswordRef.current.value
        var newPassword = newPassowrdRef.current.value
        var retypePassword = retypePasswordRef.current.value

        if (newPassword == retypePassword) {
            updatePassword(prevPassword, newPassword)
        }
    }

    const updatePassword = (oldPassword, newPassword) => {
        var api_call = api + "LoginSignup/updatePassword?userId=" + user.userId + "&oldPassword=" + oldPassword + "&newPassword=" + newPassword
        fetch(api_call, {
            method: "PUT",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            }
        }).then(async res => {
            if (res.ok) {
                setEdit("")
            }

        })
    }

    const updateCurrencyPref = () => {
        user.currencyId = selectedCurrencyId
        updateUser()

        var api_call = api + "Destinations/getCurrency?currencyId=" + user.currencyId
        fetch(api_call, {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            setCurrency(await res.json())
        })

        alert("New preffered currency has been set")
    }

    const LogOut = () => {
        setToken("")
        setUser(null)
        navigate("/")
    }

    return (
        <>
            <Header />

            <div className="container">
                <div className="profile">
                    <h2>Profile</h2>
                    <div className="profile-details">
                        <img src="\src\assets\profile.jpg" alt="profile picture" ></img>

                        <div>
                            <p>Name: {user.userName} </p>
                            <p>Surname: {user.userSurname}</p>
                            <p>Bio: {user.userBio}</p>
                        </div>
                    </div>
                    <button onClick={() => setEdit("Profile")}>Edit profile</button>
                    <p>Email: {user.userEmail}</p>
                    <button onClick={() => setEdit("Email")}>Edit email</button>
                    <p>Password: ******</p>
                    <button onClick={() => setEdit("Password")}>Edit password</button>
                    <p>Currency preference:</p>
                    <select placeholder="Select a currency preference" value={selectedCurrencyId} onChange={(e) => setSelectedCurrencyId(e.target.value)} required>
                        {currencies.map((curr) => {
                            return <option key={curr.currencyId} value={curr.currencyId}>{curr.currencyName} ({curr.currencySymbol})</option>
                        })}
                    </select>
                    <button onClick={() => updateCurrencyPref()}>Set preference</button><br /><br />
                    <button onClick={() => LogOut()}>Log out</button>
                </div>

                {edit == "Profile" ?
                    <div className="edit-profile">

                        <h2>Editing profile</h2>
                        <img src="\src\assets\profile icon.png" alt="profile picture"></img>

                        <div>
                            <p>Name: </p>
                            <input placeholder="name" value={name} onChange={(e) => setName(e.target.value)}></input>
                            <p>Surname: </p>
                            <input placeholder="surname" value={surname} onChange={(e) => setSurname(e.target.value)}></input>
                            <p>Bio: </p>
                            <textarea placeholder="bio" value={bio} onChange={(e) => setBio(e.target.value)}></textarea>
                        </div>

                        <div>
                            <button onClick={() => setEdit("")}>Cancel</button>
                            <button onClick={() => editProfileDetails()}>Save</button>
                        </div>

                    </div>
                    : <></>
                }

                {edit == "Email" ?
                    <div className="edit-profile">
                        <h2>Editing email</h2>

                        <div>
                            <p>Previous email: </p>
                            <input placeholder="previous email" value={email} onChange={(e) => setEmail(e.target.value)}></input>
                            <p>New email: </p>
                            <input ref={newEmailRef} placeholder="new email"></input>
                            <p>Retype email: </p>
                            <input ref={retypeEmailRef} placeholder="retype email"></input>

                        </div>

                        <div>
                            <button onClick={() => setEdit("")}>Cancel</button>
                            <button onClick={() => editEmailDetails()}>Save</button>
                        </div>
                    </div>
                    : <></>
                }

                {edit == "Password" ?
                    <div className="edit-profile">
                        <h2>Editing password</h2>

                        <div className="edit-profile-form-info">
                            <p>Previous password: </p>
                            <input ref={prevPasswordRef} placeholder="previous password"></input>
                            <p>New password: </p>
                            <input ref={newPassowrdRef} placeholder="new password"></input>
                            <p>Confirm password: </p>
                            <input ref={retypePasswordRef} placeholder="confirm password"></input>
                        </div>

                        <div className="edit-profile-form-buttons">
                            <button onClick={() => setEdit("")}>Cancel</button>
                            <button onClick={() => editPasswordDetails()}>Save</button>
                        </div>
                    </div>
                    : <></>
                }

            </div>

            <Footer />
        </>
    )
}

export default Profile