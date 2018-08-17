import json

import banks.static_data as data
import requests

# post url
post_url = 'https://pay.weixin.qq.com/index.php/core/applymentnew/query_bank_list'
# 请求结果
result = []

import queue
import threading
import time

import requests



# 1. 填写你的参数
ecc_csrf_token = ''
merchantId = ''
myCookie = ''
Referer = ''

# 2. # pyhton bank.py


taskQueue = queue.Queue()
workQueue = queue.Queue()


class FetchThread(threading.Thread):
    def __init__(self, tQueue, wQueue):
        threading.Thread.__init__(self)
        self.tQueue = tQueue
        self.wQueue = wQueue

    def run(self):
        while True:
            bank = self.tQueue.get()
            if bank is None:
                break
            try:
                date_r= getBanks(bank)
                result.extend(date_r)
                # self.wQueue.put(date_r)
            except Exception as e:
                print(e)

            self.tQueue.task_done()


class WorkThread(threading.Thread):
    def __init__(self, wQueue):
        threading.Thread.__init__(self)
        self.wQueue = wQueue

    def run(self):
        while True:
            text = self.wQueue.get()
            if text is None:
                break
            self.wQueue.task_done()


start_time = time.time()


def getBanks(bank_id):
    r = []
    for p in data.city:
        # print(p['name'],p['value'])
        for c in p['children']:
            headers = {
                'user-agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36',
                'Cookie': myCookie,
                'Content-Type': 'application/x-www-form-urlencoded',
                'Host': 'pay.weixin.qq.com',
                'Origin': 'https: // pay.weixin.qq.com',
                'Referer': myReferer
            }
            resp = requests.post(post_url, headers=headers, data={
                'bankId': bank_id,
                'provinceId': p['value'],
                'cityId': c['value'],
                'mode': '5',
                'ecc_csrf_token': ecc_csrf_token,
                'merchantId': merchantId
            })
            resp.encoding = 'utf-8'
            if resp.status_code == 200:
                sub_banks = resp.json()['data']
                for sub in sub_banks:
                    sub['provinceId'] = p['value']
                    sub['cityId'] = c['value']
                    sub['bankId'] = bank_id
                    r.append(sub)
                if len(sub_banks) > 0:
                    print('bank_id', bank_id, 'provinceId', p['value'], 'cityId', c['value'], 'ok')
                else:
                    print('bank_id', bank_id, 'provinceId', p['value'], 'cityId', c['value'], 'empty')
            else:
                print("error:", resp.status_code)
    return r


def main():
    for i in range(25):
        t = FetchThread(taskQueue, workQueue)
        t.setDaemon(True)
        t.start()

    for bank in data.banks:
        taskQueue.put(bank['value'])

    for i in range(6):
        dt = WorkThread(workQueue)
        dt.setDaemon(True)
        dt.start()

    workQueue.join()
    taskQueue.join()


main()

with open("data/banks.txt", "w") as f:
    f.write(json.dumps(result))

print("size=" + str(workQueue.qsize()))
print("task finished by {} seconds.".format(time.time() - start_time))
