try:
    import numpy
    import cx_Freeze
    import pyaudio
except Exception as ex:
    print(ex)
    exit(666)