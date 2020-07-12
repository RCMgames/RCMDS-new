import hypermedia.net.*;
int wifiPort=25210;
String wifiIP="10.25.21.1";
byte arrayToSend[]=new byte[255];
byte wifiArrayCounter=0;
int arrayRecvd[]=new int [255];
UDP udp;
long wifiReceivedMillis=0;
long wifiSentMillis=0;
long wifiPing=-1;
static final int wifiRetryPingTime=800;
static final float disableTimeMultiplier=8;
void sendWifiData(boolean t) {
  if ((t&&millis()-wifiSentMillis>wifiRetryPingTime)||!t) {
    wifiPing=millis()-wifiSentMillis;
    if (wifiPing>wifiRetryPingTime) {
      wifiPing=-1;
    }
    wifiSentMillis=millis();
    wifiArrayCounter=0;
    sendBl(enabled);
    for (int i=0; i<8; i++) {
      sendFl(toSend[i]);
    }
    byte[] tosend=new byte[wifiArrayCounter];
    for (int i=0; i<wifiArrayCounter; i++) {
      tosend[i]=arrayToSend[i];
    }
    udp.send(tosend, wifiIP, wifiPort);
  }
}
void receive( byte[] data, String ip, int port ) {//wifi event handler
  wifiReceivedMillis=millis();
  for (int i=0; i<data.length; i++) {
    arrayRecvd[i]=(256+data[i])%256;
  }
  wifiArrayCounter=0;
  WifiDataToRecv();
  sendWifiData(false);
}
void sendBl(boolean d) {
  if (d) {
    arrayToSend[wifiArrayCounter]=1;
  } else {
    arrayToSend[wifiArrayCounter]=0;
  }
  wifiArrayCounter++;
}
void sendBy(byte d) {
  arrayToSend[wifiArrayCounter]=d;
  wifiArrayCounter++;
}
void sendIn(int d) {
  arrayToSend[wifiArrayCounter] = byte((d & 0xFF));
  wifiArrayCounter++;
  arrayToSend[wifiArrayCounter] = byte(((d >>> 8) & 0xFF));  
  wifiArrayCounter++;
  arrayToSend[wifiArrayCounter] = byte(((d >>> 16) & 0xFF));  
  wifiArrayCounter++;
  arrayToSend[wifiArrayCounter] = byte(((d >>> 24) & 0xFF));  
  wifiArrayCounter++;
}
void sendFl(float d) {
  int bits = Float.floatToIntBits(d);
  arrayToSend[wifiArrayCounter] = (byte)(bits & 0xFF);  
  wifiArrayCounter++;
  arrayToSend[wifiArrayCounter] = (byte)((bits >>> 8) & 0xFF);  
  wifiArrayCounter++;
  arrayToSend[wifiArrayCounter] = (byte)((bits >>> 16) & 0xFF);  
  wifiArrayCounter++;
  arrayToSend[wifiArrayCounter] = (byte)((bits >>> 24) & 0xFF);
  wifiArrayCounter++;
}
void sendVect(PVector v) {
  sendFl(v.x);
  sendFl(v.y);
}
boolean recvBl() {
  boolean d;
  d=arrayRecvd[wifiArrayCounter]==1;
  wifiArrayCounter++;
  return d;
}
int recvBy() {
  int d;
  d=int(arrayRecvd[wifiArrayCounter]);
  wifiArrayCounter++;
  return d;
}
int recvIn() {
  int d = (arrayRecvd[wifiArrayCounter+3]<<24)+(arrayRecvd[wifiArrayCounter+2]<<16)+(arrayRecvd[wifiArrayCounter+1]<<8)+arrayRecvd[wifiArrayCounter];
  wifiArrayCounter++;
  wifiArrayCounter++;
  wifiArrayCounter++;
  wifiArrayCounter++;
  return d;
}
float recvFl() {
  String hexint=hex(byte(arrayRecvd[wifiArrayCounter+3]))+hex(byte(arrayRecvd[wifiArrayCounter+2]))+hex(byte(arrayRecvd[wifiArrayCounter+1]))+hex(byte(arrayRecvd[wifiArrayCounter]));
  float d = Float.intBitsToFloat(unhex(hexint)); 
  wifiArrayCounter++;
  wifiArrayCounter++;
  wifiArrayCounter++;
  wifiArrayCounter++;
  return d;
}
PVector recvVect() {
  return new PVector(recvFl(), recvFl());
}
