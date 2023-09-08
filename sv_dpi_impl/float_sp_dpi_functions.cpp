#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <limits.h>

extern "C" {

int32_t dpi_f32_add(int32_t int_a, int32_t int_b){
    float float_a = reinterpret_cast<float &>(int_a);
    float float_b = reinterpret_cast<float &>(int_b);

    float float_result = float_a + float_b;

    int32_t int_result = reinterpret_cast<int32_t &>(float_result);
    return int_result;
}

int32_t dpi_f32_sub(int32_t int_a, int32_t int_b){
    float float_a = reinterpret_cast<float &>(int_a);
    float float_b = reinterpret_cast<float &>(int_b);

    float float_result = float_a - float_b;

    int32_t int_result = reinterpret_cast<int32_t &>(float_result);
    return int_result;
}

int32_t dpi_f32_mul(int32_t int_a, int32_t int_b){
    float float_a = reinterpret_cast<float &>(int_a);
    float float_b = reinterpret_cast<float &>(int_b);

    float float_result = float_a * float_b;

    int32_t int_result = reinterpret_cast<int32_t &>(float_result);
    return int_result;
}

int32_t dpi_f32_div(int32_t int_a, int32_t int_b){
    float float_a = reinterpret_cast<float &>(int_a);
    float float_b = reinterpret_cast<float &>(int_b);

    float float_result = float_a / float_b;

    int32_t int_result = reinterpret_cast<int32_t &>(float_result);
    return int_result;
}

int32_t dpi_f32_sqrt(int32_t int_a){

    float float_a = reinterpret_cast<float &>(int_a);

    float float_result = sqrtf(float_a);

    int32_t int_result = reinterpret_cast<int32_t &>(float_result);
    return int_result;
}

int32_t dpi_f32_min(int32_t int_a, int32_t int_b){
    float float_a = reinterpret_cast<float &>(int_a);
    float float_b = reinterpret_cast<float &>(int_b);
    float float_result;

    if (float_a < float_b){
        float_result = float_a;
    }
    else{
        float_result = float_b;
    }

    int32_t int_result = reinterpret_cast<int32_t &>(float_result);
    return int_result;
}

int32_t dpi_f32_max(int32_t int_a, int32_t int_b){
    float float_a = reinterpret_cast<float &>(int_a);
    float float_b = reinterpret_cast<float &>(int_b);
    float float_result;

    if (float_a > float_b){
        float_result = float_a;
    }
    else{
        float_result = float_b;
    }

    int32_t int_result = reinterpret_cast<int32_t &>(float_result);
    return int_result;
}


int32_t dpi_f32_cmp_eq(int32_t int_a, int32_t int_b){
    float float_a = reinterpret_cast<float &>(int_a);
    float float_b = reinterpret_cast<float &>(int_b);

    return float_a == float_b;
}

int32_t dpi_f32_cmp_lt(int32_t int_a, int32_t int_b){
    float float_a = reinterpret_cast<float &>(int_a);
    float float_b = reinterpret_cast<float &>(int_b);
    int32_t int_result;

 if (float_a < float_b){
        int_result = 1;
    }
    else{
        int_result = 0;
    }

    return int_result;
}

int32_t dpi_f32_cmp_le(int32_t int_a, int32_t int_b){
    float float_a = reinterpret_cast<float &>(int_a);
    float float_b = reinterpret_cast<float &>(int_b);
    int32_t int_result;
    float tol = 0.0001f;
    bool cmp = fabs(float_a - float_b) < tol;

    if (cmp){
        int_result = 1;
    }
    else if (float_a < float_b){
        int_result = 1;
    }
    else{
        int_result = 0;
    }

    return int_result;
}

int32_t dpi_f32_to_u32(int32_t int_a){
    float float_a = reinterpret_cast<float &>(int_a);

    int64_t int_result = static_cast<int64_t>(float_a);

    if (int_result < 0) {
        return 0;
    } else if (int_result >= INT_MAX) {
        return INT_MAX;
    } else {
        return static_cast<int32_t>(int_result);
    }
}

int32_t dpi_u32_to_f32(int32_t int_a) {
    uint32_t input = reinterpret_cast<uint32_t &>(int_a);

    float result = static_cast<float>(input);

    return reinterpret_cast<int32_t &>(result);
}

int32_t dpi_f32_rv_classify(int32_t int_a){

    float float_a = reinterpret_cast<float &>(int_a);

    bool negative = signbit(float_a);
    bool infinite = 0;
    bool nan = 0;
    bool zero = 0;
    bool subnormal = 0;
    bool normal = 0;

    switch (fpclassify(float_a)) {
        case FP_INFINITE:   infinite = 1;   break;
        case FP_NAN:        nan = 1;        break;
        case FP_ZERO:       zero = 1;       break;
        case FP_SUBNORMAL:  subnormal = 1;  break;
        case FP_NORMAL:     normal = 1;     break;
    }

    int32_t int_result;

    if (infinite & negative){ int_result = 0;}
    else if (normal & negative){int_result = 1;}
    else if (subnormal & negative){int_result = 2;}
    else if (zero & negative){int_result = 3;}
    else if (zero & !negative){int_result = 4;}
    else if(subnormal & !negative){ int_result = 5;}
    else if (normal & !negative) {int_result = 6;}
    else if(infinite & !negative){int_result = 7;}
    else int_result = 8;

    return int_result;
}

int32_t dpi_f32_sin(int32_t int_a){
    float float_a = reinterpret_cast<float &>(int_a);

    float float_result = sin(float_a);

    int32_t int_result = reinterpret_cast<int32_t &>(float_result);
    return int_result;
}

int32_t dpi_f32_cos(int32_t int_a){
    float float_a = reinterpret_cast<float &>(int_a);

    float float_result = cos(float_a);

    int32_t int_result = reinterpret_cast<int32_t &>(float_result);
    return int_result;
}

}