const express = require('express');
const app = express();

// 라우팅
app.get('/hello', (req, res) => {
  res.send('Hello world!');
});

// Node.js 서버 실행
const start = () => {
  const port = process.env.PORT || 30605;
  app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
  });
};

const main = () => {
  start();
};

main();
