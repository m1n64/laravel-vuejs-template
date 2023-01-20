<?php

namespace App\Traits;


use App\Constants\StatusCodes;

trait JsonResponseTrait
{
    /**
     * @param string $message
     * @param array|mixed $data
     * @param int $status
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    protected function success(string $message = "", $data = [], int $status = StatusCodes::SUCCESS)
    {
        return response($this->getAnswer(true, $message, $data), $status);
    }

    /**
     * @param string $message
     * @param int $status
     * @param array|mixed $data
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    protected function error(string $message = "", int $status = StatusCodes::SUCCESS, $data = [])
    {
        return response($this->getAnswer(false, $message, $data), $status);
    }

    /**
     * @param bool $status
     * @param string $message
     * @param array $data
     * @return array
     */
    protected function getAnswer(bool $status, string $message = "",  $data = []) : array
    {
        return [
            'success' => $status,
            'message' => $message,
            'data' => $data
        ];
    }
}
