import Footer from "../Footer"
import Header from "../Header"

function Home(){

    return(
        <>
            <Header />

            <div className="home-container">
                <h2 style={{backgroundColor:"var(--background-brown)", width:"fit-content"}}>Upcoming vacations</h2>
                <div style={{width:"97%", height:"3%", borderRadius:"30px", padding:"1.5%", backgroundColor:"white", marginBottom:"1%"}}>
                    <p>Vacation plan 1</p>
                </div>
                <div style={{width:"97%", height:"3%", borderRadius:"30px", padding:"1.5%",  backgroundColor:"white", marginBottom:"1%"}}>
                    <p>Vacation plan 2</p>
                </div>
            </div>

            <Footer />
        </>
    )
}

export default Home