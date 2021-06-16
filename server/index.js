const express = require('express');
const app = express();
const database = require('./config');

const leaderboardRef = database.ref('leaderboards');

// 라우팅
app.get('/leaderboards', (req, res) => {
  leaderboardRef.on(
    'value',
    (snapshot) => {
      const data = snapshot.val();
      console.log(data.score);
      res.json(data);
    },
    (errorObject) => {
      console.log('The read failed: ' + errorObject.name);
    }
  );
});

app.post('/leaderboards', (req, res) => {
  leaderboardRef
    .push()
    .set({ name: 'nickname', score: 100, date: Date.now() })
    .then(() => {
      console.log({ name: 'nickname', score: 100, date: Date.now() });
      res.sendStatus(200);
    })
    .catch((error) => {
      console.log(error);
      res.sendStatus(500);
    });
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
