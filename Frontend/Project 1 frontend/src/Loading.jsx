import { RingLoader } from "react-spinners"

function Loading(){

    return(
        <div className="loading-screen">
            <RingLoader color="green"size={90} />
        </div>
    )
}

export default Loading