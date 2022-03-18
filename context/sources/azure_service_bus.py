
import json
from azure.servicebus import ServiceBusClient

def main(queue, args):

    servicebus_client = ServiceBusClient.from_connection_string(conn_str=args['conn_str'],
                                                                logging_enable=args.get('logging_enable', True))

    with servicebus_client:
        receiver = servicebus_client.get_queue_receiver(queue_name=args['queue_name'])
        with receiver:
            for msg in receiver:
                data = json.loads(str(msg))
                queue.put(data)
                receiver.complete_message(msg)
