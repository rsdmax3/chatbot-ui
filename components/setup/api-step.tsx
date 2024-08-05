import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { FC } from "react"
import { Button } from "../ui/button"

interface APIStepProps {
  onAwsAccessKeyChange: (value: string) => void
  onAwsSecretKeyChange: (value: string) => void
  onAwsSessionTokenChange: (value: string) => void
  awsAccessKey: string
  awsSecretKey: string
  awsSessionToken: string
}

export const APIStep: FC<APIStepProps> = ({
  onAwsAccessKeyChange,
  onAwsSecretKeyChange,
  onAwsSessionTokenChange,
  awsAccessKey,
  awsSecretKey,
  awsSessionToken
}) => {
  return (
    <>
      <div className="mt-5 space-y-2">
        <Label className="flex items-center">
          <div>AWS Access Key</div>

          <Button
            className="ml-3 h-[18px] w-[150px] text-[11px]"
            onClick={() => onAwsAccessKeyChange(awsAccessKey)}
          >
            {awsAccessKey}
          </Button>
        </Label>
      </div>
    </>
  )
}
