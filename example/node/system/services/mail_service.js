import nodemailer from "nodemailer";
import config from '../../config/global.js';

async function getMail() {
  var option = {
    host: config.mailHost,
    port: config.mailPort,
    secureConnection: true,
    requiresAuth: true,
    auth: {
      user: config.mailUsername,
      pass: config.mailPassword,
    },
    //secure: false,
    tls: {
      rejectUnauthorized: false,
    },
  };

  var mail = nodemailer.createTransport(option);
  // console.log(option);
  return { error: false, data: mail };
}
 
async function send(settings)  {

var {error,data} = await getMail();

if(error){
  return 'Mail not send';
}

  var mailData = {
    from: config.mailUsername, // sender address
    to: settings.email, // list of receivers
    subject: settings.title, // Subject line
    text: settings.body, // plain text body
    html: settings.html//"<b>Hello world?</b>", // html body
  };

  await data.sendMail(mailData);
}

export default { send };
