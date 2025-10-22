import Footer from "../../Footer"
import Header from "../../Header"
import { Outlet } from "react-router-dom"

function VacayPlan() {
    const stopReload = (event) => {
        //to stop the form from reloading when submitting
        event.preventDefault()
    }

    return (
        <>
            <Header />

            <div className="container">
                <form className="add-plan-form" onSubmit={stopReload}>
                    <Outlet />

                </form>

            </div>

            <Footer />
        </>
    )
}

export default VacayPlan