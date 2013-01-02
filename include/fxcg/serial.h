#ifndef _FXCG_SERIAL_H
#define _FXCG_SERIAL_H

#ifdef __cplusplus
extern "C" {
#endif

int Serial_Open(unsigned char *mode);
int Serial_IsOpen(void);
int Serial_Close(int mode);

int Serial_Read(unsigned char *out, int sz, short *count);
int Serial_ReadSingle(unsigned char *out);
int Serial_Peek(int idx, unsigned char *out);
int Serial_PollRX(void);
int Serial_ClearRX(void);

int Serial_Write(const unsigned char *buf, int count);
int Serial_WriteSingle(unsigned char x);
int Serial_WriteUnbuffered(unsigned char x);
int Serial_PollTX(void);
int Serial_ClearTX(void);

#ifdef __cplusplus
}
#endif

#endif
