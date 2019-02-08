const faker = require("faker");
const fs = require("fs");

const logError = err => {
  if (err) console.error(err);
};

fs.open("customer.csv", "w", (err, fd) => {
  const writeFile = str => {
    fs.write(fd, str, logError);
  };

  // create an IV for each person and a shared secret for decrypting.
  if (err) throw err;
  writeFile("first_name,last_name,email,phone,street_address,city,state_abbr,zip_code,created_dtm\n");
  for (let i = 0; i < 10000; ++i) {
    const firstName = faker.name.firstName();
    const lastName = faker.name.lastName();
    const email = faker.internet.email(firstName, lastName).toLowerCase();
    const phone = faker.phone.phoneNumberFormat();

    const streetAddress = faker.address.streetAddress();
    const city = faker.address.city();
    const state = faker.address.stateAbbr();
    const zipCode = faker.address.zipCode("#####");

    const createdOn = faker.date.past(5, "2019-02-06").toISOString();

    const record = `${firstName},${lastName},${email},${phone},${streetAddress},${city},${state},${zipCode},${createdOn}\n`;
    writeFile(record);
  }
  fs.close(fd, logError);
});


