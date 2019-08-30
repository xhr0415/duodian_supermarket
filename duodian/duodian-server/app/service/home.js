'use strict';

const Service = require('egg').Service;

class HomeService extends Service {
  async banner() {
    let res = this.app.mysql.select('banner');
    return res;
  }
  async addBanner(options) {
    let res = this.app.mysql.insert('banner',{
        ...options
    });
    return res;
  }
  async shop(pageid,limit){
    let res = await this.app.mysql.select('wares',{
        orders: [['volume','desc']],
        limit,
        offset: pageid*limit
    })
    return res;
  }
}

module.exports = HomeService;
