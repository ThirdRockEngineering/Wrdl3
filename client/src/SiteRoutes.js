import React from 'react';
import { HashRouter, Routes, Route, Navigate, BrowserRouter} from 'react-router-dom'
import App from './App';

function SiteRoutes () {

  return (
    <div>
      <h5>This is constant here</h5>
      <BrowserRouter>
      {/* <HashRouter> */}
        <Routes>
          <Route path="/home" element={<App />} />
          <Route path="*" element={<Navigate replace to="/home" />} />
        </Routes>
      </BrowserRouter>
      {/* </HashRouter> */}
    </div>
  )
}

export default SiteRoutes
