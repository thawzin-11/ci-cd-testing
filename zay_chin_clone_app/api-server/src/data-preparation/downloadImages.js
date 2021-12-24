import fs from "fs";
import { get } from "https";
import products from "./products.js";

/**
 * 
 * @param {string} url 
 * @param {string} filename 
 * @param {function(string)} callback 
 */
async function download(url, filename, callback) {
  return new Promise((resolve, reject) => {
    console.log("downloading ", filename);
    const wStream = fs.createWriteStream("images/tmp");
    get(url, (res) => {
      res.on('data', (chunk) => {
        wStream.write(chunk, (e) => {
          // console.log("failed during write stream");
          reject(e);
        })
      });
      res.on('end', () => {
        console.log("end stream");
        fs.renameSync("images/tmp", "images/" + filename + ".jpg");
        resolve(filename);
      });
    }).on("error", (e) => {
      // fs.rmSync("images/tmp");
      reject();
      // console.log("error e=", e);
    });
  });
}

for (let i = 0; i < products.length; i++) {
  const p = products[i];

  console.log("start download " + p.name);
  try {
    const filename = await download(p.image, p.name);
  } catch (error) {
    console.log("error in download function with productname=", p.name);
  }
  console.log("end downloading " + p.name);
}

