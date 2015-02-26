try:
    import numpy
    import cx_freeze
    import pyaudio
except Exception as ex:
    print(ex)
    exit(666)