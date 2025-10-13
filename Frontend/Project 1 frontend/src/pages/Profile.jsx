import { useContext, useEffect, useState } from "react"
import Footer from "../Footer"
import Header from "../Header"
import { useNavigate } from "react-router-dom"
import { MyContext } from "../MyProvider"

function Profile() {
    const { api, user } = useContext(MyContext)
    const navigate = useNavigate()
    const [edit, setEdit] = useState("")

    return (
        <>
            <Header />

            <div className="profile-container">
                <div className="profile-content">
                    <h2>Profile</h2>
                    <div className="profile-details">
                        <img src="\src\assets\profile icon.png" alt="profile picture" ></img>

                        <div>
                            <p>Name: </p>
                            <p>Surname: </p>
                            <p>Bio: </p>
                        </div>
                    </div>
                    <button onClick={() => setEdit("Profile")}>Edit profile</button>
                    <p>Email: </p>
                    <button onClick={() => setEdit("Email")}>Edit email</button>
                    <p>Password: </p>
                    <button onClick={() => setEdit("Password")}>Edit password</button>
                    <p>Currency preference: </p>
                    <button >Set preference</button>
                    <p>Notifications: </p>
                    <button >Turn on/off</button>
                </div>

                {edit == "Profile" ? 
                <div className="edit-pop-up">
                    <div className="edit-profile-form">
                        <h2>Editing profile</h2>
                        <img src="\src\assets\profile icon.png" alt="profile picture"></img>

                        <div className="edit-profile-form-info">
                            <p>Name: </p>
                            <input placeholder="name"></input>
                            <p>Surname: </p>
                            <input placeholder="surname"></input>
                            <p>Bio: </p>
                            <textarea placeholder="bio"></textarea>
                        </div>
                        
                        <div className="edit-profile-form-buttons">
                            <button onClick={() => setEdit("")}>Cancel</button>
                            <button>Save</button>
                        </div>
                    </div>
                </div>
                :<></>
                }

                {edit == "Email" ? 
                <div className="edit-pop-up">
                    <div className="edit-profile-form">
                        <h2>Editing email</h2>

                        <div className="edit-profile-form-info">
                            <p>Previous email: </p>
                            <input placeholder="previous password"></input>
                            <p>New email: </p>
                            <input placeholder="new password"></input>
                            
                        </div>
                        
                        <div className="edit-profile-form-buttons">
                            <button onClick={() => setEdit("")}>Cancel</button>
                            <button>Save</button>
                        </div>
                    </div>
                </div>:
                <></>
                }

                {edit == "Password" ? 
                <div className="edit-pop-up">
                    <div className="edit-profile-form">
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
                </div>:
                <></>
                }

            </div>

            <Footer />
        </>
    )
}

export default Profile