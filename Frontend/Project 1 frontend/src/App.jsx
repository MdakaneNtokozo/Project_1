import { BrowserRouter, Route, Router, Routes } from "react-router-dom"
import { MyProvider } from "./MyProvider"
import { lazy, Suspense } from "react"
import Profile from "./pages/Profile"
import AddVacayPlan from "./pages/AddVacayPlan"

const Landing = lazy(() => import( "./pages/Landing"))
const Home = lazy(() => import("./pages/Home"))
const Login = lazy(() => import("./pages/Login"))
const SignUp = lazy(() => import("./pages/Signup"))
const AddPlan = lazy(() => import("./pages/AddPlan"))

function App() {
  return (
    <>
      <MyProvider>
        <BrowserRouter>
          <Suspense fallback={<p className="loading">Loading</p>}>
            <Routes>
              {/* <Route path="/" element={<Login />}></Route>
              <Route path="/signup" element={<SignUp />}></Route>
              <Route path="/home" element={<Home />}></Route>
              <Route path="/addPlan" element={<AddPlan />}></Route>
              <Route path="/profile" element={<Profile />}></Route> */}
              <Route path="/" element={<Landing />}></Route>
              <Route path="/home" element={<Home />}></Route>
              <Route path="/addVacayPlan" element={<AddVacayPlan />}></Route>
            </Routes>
          </Suspense>
        </BrowserRouter>
      </MyProvider>

    </>
  )
}

export default App
