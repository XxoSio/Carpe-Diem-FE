import {
    USER_LOADING_REQUEST,
    USER_LOADING_SUCCESS,
    USER_LOADING_FAILURE,
    USIM_LOADING_REQUEST,
    USIM_LOADING_SUCCESS,
    USIM_LOADING_FAILURE,
} from '../types';

const initialState = {
    isAuthenticated: false,
    isLoading: false,
    errorMsg: '',
    successMsg: '',
    usim: [],
};

const authReducer = (state = initialState, action: any) => {
    switch (action.type) {
        case USER_LOADING_REQUEST:
            return {
                ...state,
                errorMsg: '',
                isLoading: true,
            };

        case USER_LOADING_SUCCESS:
            return {
                ...state,
                ...action.payload,
                isAuthenticated: true,
                isLoading: false,
            };

        case USER_LOADING_FAILURE:
            return {
                ...state,
                ...action.payload,
                isAuthenticated: false,
                isLoading: false,
            };
        default:
            return state;
    }
};

const usimReducer = (state = initialState, action: any) => {
    switch (action.type) {
        case USIM_LOADING_REQUEST:
        case USIM_LOADING_SUCCESS:
            return {
                ...state,
                usim: action.payload,
            };
        default:
            return {
                ...state,
            };
    }
};

export { authReducer, usimReducer };