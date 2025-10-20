import { BrowserRouter, Route, Routes } from "react-router-dom"
import { MyProvider } from "./MyProvider"
import { lazy, Suspense } from "react"
import Profile from "./pages/Profile"
import ViewVacayPlan from "./pages/ViewVacayPlan"

const Loading = lazy(() => import(  "./Loading" ))
const AddVacayPlan = lazy(() => import(  "./pages/AddVacayPlan"))
const SelectDest = lazy(() => import(  "./pages/AddPlanSections/SelectDest"))
const AddDetails = lazy(() => import(  "./pages/AddPlanSections/AddDetails"))
const SelectTrans = lazy(() => import(  "./pages/AddPlanSections/SelectTrans"))
const SelectAccomm = lazy(() => import(  "./pages/AddPlanSections/SelectAccomm"))
const SelectFoodSpot = lazy(() => import(  "./pages/AddPlanSections/SelectFoodSpot"))
const SelectAttr = lazy(() => import(  "./pages/AddPlanSections/SelectAttr"))
const VacayPlanPreview = lazy(() => import(  "./pages/VacayPlanPreview"))
const Landing = lazy(() => import( "./pages/Landing"))
const Home = lazy(() => import("./pages/Home"))

function App() {
  return (
    <>
      <MyProvider>
        <BrowserRouter>
          <Suspense fallback={<Loading />}>
            <Routes>
              {/* 
              <Route path="/profile" element={<Profile />}></Route> */}
              <Route path="/" element={<Landing />}></Route>
              <Route path="/home" element={<Home />}></Route>
              <Route path="/addVacayPlan" element={<AddVacayPlan />}>
                <Route path="" element={<SelectDest />}></Route>
                <Route path="addDetails" element={<AddDetails />}></Route>
                <Route path="selectTrans" element={<SelectTrans />}></Route>
                <Route path="selectAccomm" element={<SelectAccomm />}></Route>
                <Route path="selectFoodSpot" element={<SelectFoodSpot />}></Route>
                <Route path="selectAttr" element={<SelectAttr />}></Route>
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
