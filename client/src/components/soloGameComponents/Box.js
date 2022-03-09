import { useEffect, useState } from "react";
import BackspaceIcon from "@mui/icons-material/Backspace";
import Box from "@mui/material/Box"

function LetterBox(props) {
  let defaultStyle ={
    color: "rgb(0 0 0)",
    border: "2px solid rgb(209 213 219)",
    borderRadius: "0.25rem"
  }
  // const [state, setState] = useState("text-black border-2 border-gray-300 dark:bg-zinc-800 dark:text-white rounded");
  const [state, setState] = useState(defaultStyle)

  useEffect(() => {
    setTimeout(() => {
      if (props.state === "C")
        // setState("bg-correct text-white");
        setState({
          backgroundColor: "#20AA57",
          color: "white",
          border: "2px solid #20AA57"
        })
      if (props.state === "E")
        // setState("bg-exist text-white");
        setState({
          backgroundColor: "#E5B22D",
          color: "white",
          border: "2px solid #E5B22D"
        })
      if (props.state === "N")
        // setState("bg-wrong text-white dark:bg-gray-600");
        setState({
          backgroundColor: "#989898",
          color: "white",
          border: "2px solid #989898"
        })
    }, 125 * props.pos);
  }, [props.state]);

  return (
    // <div
    //   className={
    //     "h-12 w-12 sm:w-14 sm:h-14 grid place-items-center p-0 m-0 font-bold text-2xl rounded-sm " + state
    //   }
    // >
    <Box sx={{
      ...state,
      display: "grid",
      height: "3rem",
      width: "3rem",
      placeItems: "center",
      padding: "0px",
      margin: "0px",
      fontWeight: "700",
      fontSize: "1.5rem",
      lineHeight: "2rem",
      borderRadius: "0.125rem"
    }}>
      {props.value === "DEL" ? <BackspaceIcon /> : props.value}
    </Box>
    // </div>
  );
}

export default LetterBox;
