import { useState } from "react";
import Footer from "../Footer";
import Header from "../Header";
import Login from "./UserSections/Login";

function Landing() {
    const [page, setPage] = useState("")
    
    
    return(
        <div className="">
            <Header /> 

            <div className="container">
                <div className="landing">
                    <h1>Get to know your <span className="playwrite-de-sas-beautiful-font">vacay budget</span>, before your vacay starts</h1>
                    <button onClick={() => setPage("Login")}>Get started</button>
                </div>
                {page == "Login" ?
                    <div className="container-popup" onClick={() => setPage("")}> 
                        <Login />
                    </div>
                    : <></>
                }
            </div>

            <Footer />

            
        </div>

    );
}

export default Landing