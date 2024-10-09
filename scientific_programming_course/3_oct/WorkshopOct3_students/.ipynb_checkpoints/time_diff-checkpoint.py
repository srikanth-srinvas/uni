# Import modules
import datetime

# Define function which calculates time difference in seconds
def time_diff(t1, t2):
    """
    Calculates the time difference in whole seconds between t1 and t2
    The function assumes t2 is after t1
    Times should be in the format "hours:minutes:seconds.milliseconds"

    Args:
        t1 (string): The first time point
        t2 (string): The second time point, should be later than t1

    Returns:
        The difference between t1 and t2 in seconds (int).

    Examples:
        >>> time_diff("09:59:02.600", "10:06:19.200")
        437
    """
    t1 = datetime.datetime.strptime(t1, '%H:%M:%S.%f').time()
    t2 = datetime.datetime.strptime(t2, '%H:%M:%S.%f').time()
    h1, m1, s1 = t1.hour, t1.minute, t1.second
    h2, m2, s2 = t2.hour, t2.minute, t2.second
    t1_secs = s1 + 60 * (m1 + 60*h1)
    t2_secs = s2 + 60 * (m2 + 60*h2)
    return(t2_secs - t1_secs)

#print(time_diff("09:59:02.600", "10:06:19.200"))

#help(time_diff)