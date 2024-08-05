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
      <div className="mt-5 space-y-4">
        <div>
          <Label htmlFor="awsAccessKey">AWS Access Key</Label>
          <Input
            id="awsAccessKey"
            type="text"
            value={awsAccessKey}
            onChange={e => onAwsAccessKeyChange(e.target.value)}
            placeholder="Enter AWS Access Key"
          />
        </div>
        <div>
          <Label htmlFor="awsSecretKey">AWS Secret Key</Label>
          <Input
            id="awsSecretKey"
            type="password"
            value={awsSecretKey}
            onChange={e => onAwsSecretKeyChange(e.target.value)}
            placeholder="Enter AWS Secret Key"
          />
        </div>
        <div>
          <Label htmlFor="awsSessionToken">AWS Session Token (optional)</Label>
          <Input
            id="awsSessionToken"
            type="text"
            value={awsSessionToken}
            onChange={e => onAwsSessionTokenChange(e.target.value)}
            placeholder="Enter AWS Session Token (if applicable)"
          />
        </div>
      </div>
    </>
  )
}
