import logging
import json

def logger(log_level, source, next_func, data= {}):
    logger_= logging.getLogger(__name__)
    log_message= f"Data: {json.dumps({ 'source': source, 'next_func': next_func, 'data': data})}"

    if log_level == 'debug':
        logger_.debug(log_message)
    elif log_level == 'info':
        logger_.info(log_message)
    elif log_level == 'warning':
        logger_.warning(log_message)
    elif log_level == 'error':
        logger_.error(log_message)
    elif log_level == 'exception':
        logger_.exception(log_message)
    else:
        raise ValueError(f"Invalid log level: {log_level}")