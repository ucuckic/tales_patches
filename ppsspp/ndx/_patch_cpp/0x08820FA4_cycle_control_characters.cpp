#include <stdint.h>

extern "C" void  z_un_08817630(void* state, int arg);
extern "C" void* 0x09F00D00(int index); // get_char_by_index

void shift_party_left(void* state)
{
    int partySize = *(int8_t*)((uintptr_t)state + 0x5F4);

    if (partySize > 1)
    {
        int8_t* chars    = (int8_t*)0x081E0030;
        int8_t* ctrlMode = (int8_t*)0x08B069C4;

        int forcedIndex = *(int8_t*)0x081E0004;

        int first = -1;

        for (int i = 0; i < partySize; i++)
        {
            if (i == forcedIndex || ctrlMode[i] == 0)
            {
                first = i;
                break;
            }
        }

        if (first >= 0)
        {
            int8_t saved = chars[first];
            int prev = first;

            for (int i = first + 1; i < partySize; i++)
            {
                if (i == forcedIndex || ctrlMode[i] == 0)
                {
                    chars[prev] = chars[i];
                    int8_t* charObj = (int8_t*)0x09F00D00(prev);
                    charObj[0x35] = ctrlMode[prev];
                    prev = i;
                }
            }

            chars[prev] = saved;
            int8_t* charObj = (int8_t*)0x09F00D00(prev);
            charObj[0x35] = ctrlMode[prev];
        }
    }

    z_un_08817630(state, 0);
}