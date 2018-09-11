package com.kk.core.util;

import java.io.IOException;

import org.apache.commons.lang3.StringUtils;

import com.google.android.gcm.server.InvalidRequestException;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

public class GcmUtil {

	public static Boolean sendMessage() {
		final String GCM_API_KEY = "yourKey";
		final int retries = 3;
		final String notificationToken = "deviceNotificationToken";
		Sender sender = new Sender(GCM_API_KEY);
		Message msg = new Message.Builder().build();

		try {
			Result result = sender.send(msg, notificationToken, retries);

			if (StringUtils.isEmpty(result.getErrorCodeName())) {
				return true;
			}

		} catch (InvalidRequestException e) {
		} catch (IOException e) {
		}
		return false;
	}

}