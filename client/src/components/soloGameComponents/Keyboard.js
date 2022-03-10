import { useEffect, useState } from "react";
import BackspaceIcon from "@mui/icons-material/Backspace";
import Button from "@mui/material/Button";
import Box from "@mui/material/Box"

const keyboard = {
  line1: "QWERTYUIOP",
  line2: "ASDFGHJKL",
  line3: "ZXCVBNM",
};

let defaultLetters = [];

"abcdefjhijklmnopqrstuvwxyz".split("").forEach((i) => {
  defaultLetters[i] = "";
});

function Key(props) {

  const defaultValue = {
    backgroundColor: "rgb(229 231 235)",
    '&:hover': {
      backgroundColor: "rgb(209 213 219)"
    }
  }

  // const [state, setState] = useState("bg-gray-200 hover:bg-gray-300 dark:bg-zinc-400 dark:text-white dark:hover:bg-zinc-500");
  const [state, setState] = useState(defaultValue)

  // const x = props.value.length === 1 ? "w-7 sm:w-10 " : "p-2 sm:p-4 ";
  const x = props.value.length === 1 ? { width: "1rem" } : { padding: "0.5rem" };
  const returnKey = () => {
    props.getKey(props.value);
  };

  useEffect(() => {
    setTimeout(() => {
      // if (props.state === "C") setState("bg-correct text-white");
      if (props.state === "C" ) setState( { backgroundColor: "#20AA57", color: "white"})
      // if (props.state === "E") setState("bg-exist text-white");
      if (props.state === "E") setState({ backgroundColor: "#E5B22D", color: "white"});
      // if (props.state === "N") setState("bg-wrong text-white dark:bg-gray-600");
      if (props.state === "N") setState({ backgroundColor: "#989898", color: "grey"});

    }, 350);
  }, [props.state]);


  return (
    // <button
    //   className={
    //     x +
    //     state +
    //     " h-14 300 grid items-center rounded font-semibold cursor-pointer"
    //   }
    //   onClick={returnKey}
    // >
    <Button sx={{
        ...x,
        ...state,
        height: "3.5rem",
        display: "grid",
        alignItems: "center",
        borderRadius: "0.25rem",
        fontWeight: "600",
        cursor: "pointer",
        minWidth: "none",
    }}

    onClick={returnKey}
    >
      {props.value === "DEL" ? <BackspaceIcon /> : props.value}
    </Button>
    // </button>
  );
}

function KeyBoard(props) {
  const [letters, setletters] = useState(defaultLetters);
  useEffect(() => {
    setletters(props.letters);
  }, [props.changed]);

  const keyHandler = (value) => {
    props.keyHandler(value);
  };

  const keyboardSX = {
    display: "flex",
    gap: "0.25rem",
    marginTop: "0.125rem",
    marginBottom: "0.125rem",
    width: "fit-content"
  }
  return (
    // <div className="flex flex-col items-center w-100 pb-5">
    <Box sx={{
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      width: "25rem",
      paddingBottom: "1.25rem",
      alignSelf: "center"
    }}>
      {/* <div className="flex gap-1 my-0.5 w-fit"> */}
      <Box sx={keyboardSX}>
        {keyboard.line1.split("").map((value, key) => (
          <Key
            getKey={keyHandler}
            value={value}
            key={key}
            state={letters[value]}
          />
        ))}
        </Box>
      {/* </div> */}
      {/* <div className="flex gap-1 my-0.5 w-fit"> */}
      <Box sx={keyboardSX}>
        {keyboard.line2.split("").map((value, key) => (
          <Key
            getKey={keyHandler}
            value={value}
            key={key}
            state={letters[value]}
          />
        ))}
        </Box>
      {/* </div> */}
      {/* <div className="flex gap-1 my-0.5 w-fit"> */}
      <Box sx={keyboardSX}>
        <Key value="ENTER" getKey={keyHandler} />
        {keyboard.line3.split("").map((value, key) => (
          <Key
            getKey={keyHandler}
            value={value}
            key={key}
            state={letters[value]}
          />
        ))}
        <Key value="DEL" getKey={keyHandler} />
        </Box>
      {/* </div> */}
      </Box>
    // </div>
  );
}

export default KeyBoard;
