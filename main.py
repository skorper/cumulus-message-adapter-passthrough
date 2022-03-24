from cumulus_logger import CumulusLogger
from cumulus_process import Process

cumulus_logger = CumulusLogger('cumulus_message_adapter_passthrough')

class CumulusPassthrough(Process):

    def __init__(self, *args, **kwargs):

        super(CumulusPassthrough, self).__init__(*args, **kwargs)
        # overwrite the logger as cumulus logger
        self.logger = cumulus_logger
        self.original_input = kwargs.get('input').get("payload")
        self.logger.info('input message:{}'.format(self.original_input))

    def process(self):
        """Main process """

        self.logger.info('returning message:{}'.format(self.original_input))
        return self.original_input


def handler(event, context):
    cumulus_logger.setMetadata(event, context)
    return CumulusPassthrough.cumulus_handler(event, context=context)
