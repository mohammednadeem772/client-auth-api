'use Strict'
const bcrypt = require('bcrypt');
module.exports = (sequelize, DataTypes) => {
    const Client = sequelize.define('Client', {
        name: {
            type: DataTypes.STRING,
            allowNull: false
        },
       clientId: {
            type: DataTypes.STRING,
            unique: true
        },
        clientSecret: {
            type: DataTypes.STRING,
            allowNull: false
        },
        isActive: {
            type: DataTypes.BOOLEAN,
            defaultValue: true
        }
    });
    Client.prototype.verifySecret = async function (secret) {
        return bcrypt.compareSync(secret, this.clientSecret);
    }
    
    return Client
}