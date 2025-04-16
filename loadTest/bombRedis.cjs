const Redis = require("ioredis")
const redis = new Redis({ host: '127.0.0.1', port: 6379 }) // adapte si besoin

const [,, totalKeysArg, valueSizeArg] = process.argv

const totalKeys = parseInt(totalKeysArg) || 1000
const valueSize = parseInt(valueSizeArg) || 10 * 1024 // 10 KB

const words = [...Array(totalKeys).keys()].map((i) => `key${i}`)
const value = 'x'.repeat(valueSize)

const bombRedis = async () => {
  let count = 0
  while (true) {
    const ops = words.map((key) => redis.set(`${key}:${count}`, value))
    await Promise.all(ops)
    count++
    if (count % 10 === 0) console.log(`Written batch ${count}`)
  }
}
bombRedis()

