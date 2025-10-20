import { RingLoader } from "react-spinners"

function Loading(){

    return(
        <div style={{width:"100%", height:"100vh", backdropFilter:"blur(15px)", display:"flex", flexWrap:"wrap", justifyContent:"center", alignContent:"center", position:"absolute", zIndex:"100"}}>
            <RingLoader color="green"size={90} />
        </div>
    )
}

export default Loading