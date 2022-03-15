import subprocess
import fcntl
import resource
import hashlib
import os
import re

from cumulus_logger import CumulusLogger
from cumulus_process import Process, s3
from shutil import rmtree

cumulus_logger = CumulusLogger('cumulus_message_adapter_passthrough')


# def print_hi(name):
#     # Use a breakpoint in the code line below to debug your script.
#     print(f'Hi, {name}')  # Press ⇧⌘B to toggle the breakpoint.
#
#
# # Press the green button in the gutter to run the script.
# if __name__ == '__main__':
#     print_hi('PyCharm')

class CumulusPassthrough(Process):

    def __init__(self, *args, **kwargs):

        super(CumulusPassthrough, self).__init__(*args, **kwargs)
        self.logger = cumulus_logger

        # overwriting the logger with cumulus logger
        # regex for .nc and md5 files
        self.original_input = kwargs.get('input').get("payload")
        self.logger.info('input message:{}'.format(self.original_input))

    def process(self):
        """Main process to convert netCDF3 files to netCDF4 files."""

        self.logger.info('returning message:{}'.format(self.original_input))
        return self.original_input


def handler(event, context):
    cumulus_logger.setMetadata(event, context)
    return CumulusPassthrough.cumulus_handler(event, context=context)
