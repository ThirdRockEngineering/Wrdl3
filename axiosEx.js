const axios = require("axios");

const makeReq = async () => {
  const res = await axios.get(
    "https://onlinetexttools.com/convert-text-to-image?input=Ev"
  );
  console.log(res.data);
};

makeReq();
