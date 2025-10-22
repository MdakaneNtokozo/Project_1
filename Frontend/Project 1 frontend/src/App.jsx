import { BrowserRouter, Route, Routes } from "react-router-dom"
import { MyProvider } from "./MyProvider"
import { lazy, Suspense } from "react"



const Loading = lazy(() => import(  "./Loading" ))
const Landing = lazy(() => import( "./pages/Landing"))
const Home = lazy(() => import("./pages/Home"))
const ViewVacayPlan = lazy(() => import( "./pages/ViewVacayPlan" ))
const Profile = lazy(() => import( "./pages/UserSections/Profile" ))

const VacayPlan = lazy(() => import( "./pages/VacayPlanSections/VacayPlan" ))
const Destination = lazy(() => import( "./pages/VacayPlanSections/Destination" ))
const VacayDetails = lazy(() => import( "./pages/VacayPlanSections/VacayDetails" ))
const Transportation = lazy(() => import( "./pages/VacayPlanSections/Transportation" ))
const Accommodation = lazy(() => import( "./pages/VacayPlanSections/Accommodation" ))
const FoodSpots = lazy(() => import( "./pages/VacayPlanSections/FoodSpot" ))
const Attraction = lazy(() => import( "./pages/VacayPlanSections/Attraction" ))
const VacayPlanPreview = lazy(() => import( "./pages/VacayPlanSections/VacayPlanPreview" ))

function App() {
  return (
    <>
      <MyProvider>
        <BrowserRouter>
          <Suspense fallback={<Loading />}>
            <Routes>
              
              <Route path="/profile" element={<Profile />}></Route>
              <Route path="/" element={<Landing />}></Route>
              <Route path="/home" element={<Home />}></Route>

              <Route path="/vacayPlan" element={<VacayPlan />}>
                <Route path="" element={<Destination />}></Route>
                <Route path="vacayDetails" element={<VacayDetails />}></Route>
                <Route path="transportation" element={<Transportation />}></Route>
                <Route path="accommodation" element={<Accommodation />}></Route>
                <Route path="foodSpots" element={<FoodSpots />}></Route>
                <Route path="attractions" element={<Attraction />}></Route>
                <Route path="preview" element={<VacayPlanPreview />}></Route>
              </Route>

              <Route path="/viewVacayPlan" element={<ViewVacayPlan />}></Route>

            </Routes>
          </Suspense>
        </BrowserRouter>
      </MyProvider>

    </>
  )
}

export default App
