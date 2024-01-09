const Sequelize = require('sequelize')
var pg = require('pg')
const { Pool } = require('pg');

var user = process.env.POSTGRES_USER
var password = process.env.POSTGRES_PASSWORD
var host = process.env.POSTGRES_HOST
var port = process.env.POSTGRES_PORT
var db = process.env.POSTGRES_DB

var pgUri=`postgres://${user}:${password}@${host}:${port}/${db}`
const connectToDatabase = async () => {
    console.log('Connecting to the database ...')
    const sequelize = new Sequelize(pgUri, {
        pool: {
            max: 5,
            min: 0,
            acquire: 60000,
            idle: 10000
        }
    })
    await sequelize.authenticate().then(() => {
        console.log('Connection has been established successfully!');
    }).catch(err => {
        console.error('Unable to connect to the database: ', err);
    });
}

exports.connectToDatabase = connectToDatabase
