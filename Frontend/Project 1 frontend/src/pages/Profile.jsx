import { useContext, useEffect, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"
import { MyContext } from "../MyProvider"

function Profile() {
    const { api, token, user } = useContext(MyContext)
    const [edit, setEdit] = useState("")
    const [currencies, setCurrencies] = useState([])
    const [currency, setCurrency] = useState(null)

    useEffect(() =>{
        var api_call = api + "Destinations/getCurrencies"
        fetch(api_call, {
            method: "GET",
            headers: { 
                "Authorization": "Bearer " + token,
                "Content-Type": "application/json"
            },
        }).then(async res => {
            const data = await res.json()
            setCurrencies( data )
            setCurrency( data.find(c => c.currId == user.currId))
        })
        
    }, [])

    return (
        <>
            <Header />

            <div className="container">
                <div className="profile">
                    <h2>Profile</h2>
                    <div className="profile-details">
                        <img src="\src\assets\profile icon.png" alt="profile picture" ></img>

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
                    <p>Currency preference: {currency != null ? currency.currName + " (" + currency.currSymbol + ")": ""} </p>
                    <button >Set preference</button>
                    <p>Notifications: {user.notificationOn == 1 ? "On" : "Off"}</p>
                    <button >Turn on/off</button>
                </div>

                {edit == "Profile" ? 
                <div className="edit-profile">
             
                        <h2>Editing profile</h2>
                        <img src="\src\assets\profile icon.png" alt="profile picture"></img>

                        <div>
                            <p>Name: </p>
                            <input placeholder="name" value={user.userName}></input>
                            <p>Surname: </p>
                            <input placeholder="surname" value={user.userSurname}></input>
                            <p>Bio: </p>
                            <textarea placeholder="bio" value={user.userBio}></textarea>
                        </div>
                        
                        <div>
                            <button onClick={() => setEdit("")}>Cancel</button>
                            <button>Save</button>
                        </div>
                    
                </div>
                :<></>
                }

                {edit == "Email" ? 
                <div className="edit-profile">
                    <h2>Editing email</h2>

                        <div>
                            <p>Previous email: </p>
                            <input placeholder="previous password" value={user.userEmail}></input>
                            <p>New email: </p>
                            <input placeholder="new password"></input>
                            <p>Retype email: </p>
                            <input placeholder="retype password"></input>
                            
                        </div>
                        
                        <div>
                            <button onClick={() => setEdit("")}>Cancel</button>
                            <button>Save</button>
                        </div>
                </div>
                :<></>
                }

                {edit == "Password" ? 
                <div className="edit-profile">
                    <h2>Editing password</h2>

                        <div className="edit-profile-form-info">
                            <p>Previous password: </p>
                            <input placeholder="previous password"></input>
                            <p>New password: </p>
                            <input placeholder="new password"></input>
                            <p>Confirm password: </p>
                            <input placeholder="confirm password"></input>
                        </div>
                        
                        <div className="edit-profile-form-buttons">
                            <button onClick={() => setEdit("")}>Cancel</button>
                            <button>Save</button>
                        </div>
                </div>
                :<></>
                }

            </div>

            <Footer />
        </>
    )
}

export default Profile