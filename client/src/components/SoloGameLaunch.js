import SoloGame from "./soloGameComponents/SoloGame";
import "./soloGame.css";
import Box from '@mui/material/Box'

function SoloGameLaunch() {
  const darkHandler = (dark) => {
    if (dark) document.documentElement.classList.add("dark");
    else document.documentElement.classList.remove("dark");
  };

  return (
    // <div className={"app dark:bg-zinc-800"}>
    <Box sx={{
      textAlign : "center",
      display: "grid",
      justifyItems: "center",
      minHeight : "100vh",
      p : 0,
      margin: "0"
    }}>
      <SoloGame darkness={darkHandler} />
    </Box>
    // </div>
  );
}

export default SoloGameLaunch;
